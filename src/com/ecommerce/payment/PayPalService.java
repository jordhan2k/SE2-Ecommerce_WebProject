package com.ecommerce.payment;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ecommerce.model.Cart;
import com.ecommerce.model.CartLine;
import com.ecommerce.service.CartLineService;
import com.ecommerce.service.impl.CartLineServiceImpl;
import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

public class PayPalService {

	CartLineService cartLineService = new CartLineServiceImpl();

	private static final String CLIENT_ID = "AWhcdW0ZT4lDKI-KdIQpDQcismJ-A1A2ew2KLHA2SGTp5c89iPj9QBrqcQXDhkeWJP8YSOedE_Xz3O0_";
	private static final String CLIENT_SECRET = "EGJmyNlf0cLYs5Jq5orXzDqmGsnpw_yJ-wVCEN_Zvcckf24DIxLH_P25oSOIB-C7J73VlaOfhirCwMCg";
	private static final String MODE = "sandbox";

//	private static final String CLIENT_ID = "AeWpNhJLY_mioNSgx3ui7MWuVC6EMB9Qdt3zHH0T5s6EUC9xRn-cYG1PHsvDjY6WPqPtCYCpzgkj_EE7";
//	private static final String CLIENT_SECRET = "EC0FUhda46ekpTd865QRvYr17zG60iTH6ycr1K8n1K_DFbrfUrkqLg4SVuvKZI2SdVol1u9rpdXtkQdz";
//	private static final String MODE = "sandbox";

	public PayPalService() {

	}

	public String authorizePayment(Map<Integer, CartLine> map) throws PayPalRESTException {
		Payer payer = getPayerInformation();
		RedirectUrls redirectUrls = getRedirectUrls();

		List<Transaction> transactions = getTransactionInformation(map);
		Payment requestPayment = new Payment();

		requestPayment.setTransactions(transactions);
		requestPayment.setRedirectUrls(redirectUrls);
		requestPayment.setPayer(payer);
		requestPayment.setIntent("authorize");

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

		Payment approvedPayment = requestPayment.create(apiContext);

		return getApprovalLink(approvedPayment);
	}

	/**
	 * Get payer information, which is later sent to PayPal for verification
	 * 
	 * @return
	 */
	private Payer getPayerInformation() {

		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");

		PayerInfo payerInfo = new PayerInfo();

		payerInfo.setFirstName("A").setLastName("B").setEmail("email");

		payer.setPayerInfo(payerInfo);
		return payer;

	}

	/**
	 * Specify the urls to which PayPal will redirect during the checkout process
	 * 
	 * @return
	 */
	private RedirectUrls getRedirectUrls() {
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl("http://localhost:8080/SE2-Ecommerce_WebProject/");
		redirectUrls.setReturnUrl("http://localhost:8080/SE2-Ecommerce_WebProject/customer/review_payment");
		return redirectUrls;

	}

	/**
	 * Get all order details to send to PayPal
	 * 
	 * @param cart
	 * @return
	 */
	private List<Transaction> getTransactionInformation(Map<Integer, CartLine> map) {

		long subtotal = 0;

		for (CartLine line : map.values()) {

			subtotal += line.getUnitPrice() * line.getQuantity();
		}
		System.out.println(subtotal);
		Details details = new Details();

		details.setShipping("30000");
		details.setSubtotal("" + subtotal);
		details.setTax("0");

		Amount amount = new Amount();

		amount.setCurrency("VND");
		amount.setTotal("" + (subtotal + 30000));

		amount.setDetails(details);

		Transaction transaction = new Transaction();
		transaction.setAmount(amount);
		transaction.setDescription("A");

		ItemList itemList = new ItemList();

		List<Item> items = new ArrayList<Item>();

		for (CartLine line : map.values()) {
			Item item = new Item();
			item.setCurrency("VND");
			item.setName(line.getProduct().getProductName());
			item.setPrice("" + (line.getQuantity() * line.getUnitPrice()));
			item.setQuantity("" + line.getQuantity());

			items.add(item);
		}

		itemList.setItems(items);
		transaction.setItemList(itemList);

		List<Transaction> transactions = new ArrayList<Transaction>();
		transactions.add(transaction);

		return transactions;

	}

	/**
	 * Parse the approved Payment object returned from PayPal. Find approval URL in
	 * JSON response.
	 * 
	 * @param approvedPayment
	 * @return
	 */
	private String getApprovalLink(Payment approvedPayment) {
		List<Links> links = approvedPayment.getLinks();
		String approvalLink = null;

		for (Links link : links) {
			if (link.getRel().equalsIgnoreCase("approval_link")) {
				approvalLink = link.getHref();
				break;
			}
		}

		return approvalLink;
	}

	/**
	 * 
	 * @param paymentID
	 * @param payerID
	 * @return
	 * @throws PayPalRESTException
	 */
	public Payment executePayment(String paymentID, String payerID) throws PayPalRESTException {
		PaymentExecution paymentExecution = new PaymentExecution();
		paymentExecution.setPayerId(payerID);
		Payment payment = new Payment().setId(paymentID);

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

		return payment.execute(apiContext, paymentExecution);

	}

}
