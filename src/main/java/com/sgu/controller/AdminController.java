package com.sgu.controller;

import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.sgu.entity.Category;
import com.sgu.entity.Order;
import com.sgu.entity.Order_Item;
import com.sgu.entity.Product;
import com.sgu.entity.ProductImage;
import com.sgu.entity.User;
import com.sgu.model.Mail;
import com.sgu.service.CategoryService;
import com.sgu.service.MailService;
import com.sgu.service.OrderService;
import com.sgu.service.Order_ItemService;
import com.sgu.service.ProductImageService;
import com.sgu.service.ProductService;
import com.sgu.service.UserService;

@Controller
public class AdminController {
	@Autowired
	OrderService orderService;

	@Autowired
	UserService userService;

	@Autowired
	ProductService productService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	Order_ItemService order_ItemService;

	@Autowired
	MailService mailService;

	@Autowired
	HttpSession session;

	@Autowired
	ProductImageService productImageService;
	
	@GetMapping("/terms_service")
	public String TermsService(Model model) {
		//Đăng xuất nếu cần thiết
	    //session.setAttribute("admin", null);
	    return "terms_service";
	}


	@GetMapping("/signin-admin")
	public String SignInAdminView(Model model) {
		String err_sign_admin = (String) session.getAttribute("err_sign_admin");
		model.addAttribute("err_sign_admin", err_sign_admin);
		session.setAttribute("err_sign_admin", null);
		return "signin-admin";
	}

	@PostMapping("/signin-admin")
	public String SignInAdminHandel(@ModelAttribute("login-name") String login_name,
			@ModelAttribute("pass") String pass, Model model) throws Exception {
		User admin = userService.findByIdAndRole(login_name, "admin");
		System.out.println(admin);
		if (admin == null) {
			session.setAttribute("err_sign_admin", "Username or Password is not correct!");
			return "redirect:/signin-admin";
		} else {
			String decodedValue = new String(Base64.getDecoder().decode(admin.getPassword()));
			if (!decodedValue.equals(pass)) {
				session.setAttribute("err_sign_admin", "Username or Password is not correct!");
				return "redirect:/signin-admin";
			} else {
				System.out.println(admin);
				session.setAttribute("admin", admin);
				return "redirect:/dashboard";
			}
		}
	}

	@GetMapping("/logout-admin")
	public String LogOutAdmin(Model model) {
		session.setAttribute("admin", null);
		return "redirect:/signin-admin";
	}

	@GetMapping("/dashboard")
	public String DashboardView(Model model) {
		User admin = (User) session.getAttribute("admin");
		System.out.println("======");
		if (admin == null) {
			return "redirect:/signin-admin";
		} else {
			List<Order> listOrder = orderService.findAll();
			List<Product> listProduct = productService.getAllProduct();
			List<User> listUser = userService.findAll();
			List<Category> listCategory = categoryService.findAll();

			model.addAttribute("Total_Order", listOrder.size());
			model.addAttribute("Total_Product", listProduct.size());
			model.addAttribute("Total_User", listUser.size());
			model.addAttribute("Total_Category", listCategory.size());
			return "dashboard";
		}
	}

	@GetMapping("/dashboard-invoice/{id}")
	public String InvoiceView(@PathVariable int id, Model model, HttpServletRequest request) {
		Order order = orderService.findById(id);
		List<Order_Item> listOrder_Item = order_ItemService.getAllByOrder_Id(order.getId());
		model.addAttribute("listOrder_Item", listOrder_Item);
		model.addAttribute("order", order);
		return "dashboard-invoice";
	}

	@GetMapping("/dashboard-orders")
	public String DashboardOrderView(Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/signin-admin";
		} else {
			Pageable pageable = PageRequest.of(0, 3);
			Page<Order> pageOrder = orderService.findAll(pageable);
			model.addAttribute("pageOrder", pageOrder);
			return "dashboard-orders";
		}
	}

	@GetMapping("/dashboard-orders/{page}")
	public String DashboardOrderPageView(@PathVariable int page, Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/signin-admin";
		} else {
			Pageable pageable = PageRequest.of(page, 3);
			Page<Order> pageOrder = orderService.findAll(pageable);
			model.addAttribute("pageOrder", pageOrder);
			return "dashboard-orders";
		}
	}

	@PostMapping("/send-message")
	public String SendMessage(Model model, @ModelAttribute("message") String message,
			@ModelAttribute("email") String email, HttpServletRequest request) throws Exception {
		String referer = request.getHeader("Referer");
		System.out.println(message);
		System.out.println(email);
		Mail mail = new Mail();
		mail.setMailFrom("chibaodang2002@gmail.com");
		mail.setMailTo(email);
		mail.setMailSubject("Xin chào đây là SGU Coffee!");
		mail.setMailContent(message);
		mailService.sendEmail(mail);
		return "redirect:" + referer;
	}

	@GetMapping("/delete-order/{id}")
	public String DeleteOrder(@PathVariable int id, Model model, HttpServletRequest request) throws Exception {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/signin-admin";
		} else {
			String referer = request.getHeader("Referer");
			Order order = orderService.findById(id);
			System.out.println(order);
			if (order != null) {
				for (Order_Item y : order.getOrder_Item()) {
					order_ItemService.deleteById(y.getId());
				}
				orderService.deleteById(id);
			}
			return "redirect:" + referer;
		}
	}

	@GetMapping("dashboard-wallet")
	public String DashboardWalletView(Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/signin-admin";
		} else {
			List<Order> listOrder = orderService.findAll();
			List<Order> listPaymentWithMomo = orderService.findAllByPayment_Method("Pay with ZaloPay");
			List<Order> listPaymentOnDelivery = orderService.findAllByPayment_Method("Pay on Delivery");
			int TotalMomo = 0;
			int TotalDelivery = 0;
			for (Order y : listPaymentWithMomo) {
				TotalMomo = TotalMomo + y.getTotal();
			}
			for (Order y : listPaymentOnDelivery) {
				TotalDelivery = TotalDelivery + y.getTotal();
			}
			model.addAttribute("TotalMomo", TotalMomo);
			model.addAttribute("TotalDelivery", TotalDelivery);
			model.addAttribute("TotalOrder", listOrder.size());
			return "dashboard-wallet";
		}
	}
	
	@GetMapping("/redirect")
	public String Redirect(Model model, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}
	
	// CRUD USER CONTROLLER

	@GetMapping("/contact_gpt")
	public String contactGpt() {
		return "contact_gpt";
	}
	
	@GetMapping("/list_user")
	public String viewListUser(Model model) {
	    User admin = (User) session.getAttribute("admin");
	    if (admin == null) {
	        return "redirect:/signin-admin";
	    }
	    
  	    // Xuất danh sách user ra console
//	    List<User> listUser = userService.getAllUsers();
//	    for (User user : listUser) {
//	        System.out.println(user);
//	    }

	    return findPaginatedUser(1, "id", "asc", model);
	}

	@GetMapping("/showNewUserForm")
	public String showNewUserForm(Model model) {
	    User admin = (User) session.getAttribute("admin");
	    if (admin == null) {
	        return "redirect:/signin-admin";
	    }
	    User user = new User();
	    model.addAttribute("user", user);
	    return "create_user";
	}

	@PostMapping("/saveUser")
	public String saveUser(@ModelAttribute("user") User user) {
	    userService.saveUser(user);
	    return "redirect:/list_user";
	}

	@GetMapping("/updateListUser/{id}")
	public String updateListUser(@PathVariable(value = "id") String id, Model model) {
	    User admin = (User) session.getAttribute("admin");
	    if (admin == null) {
	        return "redirect:/signin-admin";
	    }
	    User user = userService.getUserById(id);
	    model.addAttribute("user", user);
	    return "update_user";
	}

	@GetMapping("/deleteUser/{id}")
	public String deleteUser(@PathVariable(value = "id") String id) {
	    User admin = (User) session.getAttribute("admin");
	    if (admin == null) {
	        return "redirect:/signin-admin";
	    }
	    this.userService.deleteUserById(id);
	    return "redirect:/list_user";
	}
	
	// CRUD PRODUCT CONTROLLER

	@GetMapping("/list_product")
	public String viewListProduct(Model model) {
	    List<Product> productList = productService.getAllProduct();

	    if (!productList.isEmpty()) {

	        Product firstProduct = productList.get(0);
	        List<ProductImage> firstProductImages = firstProduct.getProductImage();

	        model.addAttribute("productList", productList);
	        model.addAttribute("firstProductImages", firstProductImages);
	    }

	    return findPaginatedProduct(1, "id", "asc", model);
	}
	
	@GetMapping("/showNewProductForm")
	public String showNewProductForm(Model model) {
		Product product = new Product();
		model.addAttribute("product", product);
		List<ProductImage> productImages = product.getProductImage();
		model.addAttribute("productImages", productImages);
		return "create_product";
	}
	
	@PostMapping("/saveProduct")
	public String saveProduct(@ModelAttribute("product") Product product) {
		productService.saveProduct(product);
		return "redirect:/list_product";
	}
	
	@GetMapping("/updateListProduct/{id}")
	public String updateListProduct(@PathVariable(value = "id") String id, Model model) {
	    Product productToUpdate = productService.getProductById(id);
	    model.addAttribute("product", productToUpdate);
	    return "update_product";
	}


	
	@GetMapping("/deleteProduct/{id}")
	public String deleteProduct(@PathVariable (value = "id") String id) {
		this.productService.deleteProductById(id);
		return "redirect:/list_product";
	}
	
	
	// PHÂN TRANG CHO USER VÀ PRODUCT
	
	
	@GetMapping("/pageUser/{pageNo}")
	public String findPaginatedUser(@PathVariable(value = "pageNo") int pageNo,
	        @RequestParam("sortField") String sortField,
	        @RequestParam("sortDir") String sortDir,
	        Model model) {
	    int pageSize = 5;

	    Page<User> page = userService.findPaginated(pageNo, pageSize, sortField, sortDir);
	    List<User> listUser = page.getContent();

	    model.addAttribute("currentPage", pageNo);
	    model.addAttribute("totalPages", page.getTotalPages());
	    model.addAttribute("totalItems", page.getTotalElements());

	    model.addAttribute("sortField", sortField);
	    model.addAttribute("sortDir", sortDir);
	    model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");

	    model.addAttribute("listUser", listUser);
	    return "list_user";
	}
	
	@GetMapping("/pageProduct/{pageNo}")
	public String findPaginatedProduct(@PathVariable (value = "pageNo") int pageNo, 
			@RequestParam("sortField") String sortField,
			@RequestParam("sortDir") String sortDir,
			Model model) {
		int pageSize = 5;
		
		Page<Product> page = productService.findPaginated(pageNo, pageSize, sortField, sortDir);
		List<Product> listProduct = page.getContent();
		
		model.addAttribute("currentPage", pageNo);
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("totalItems", page.getTotalElements());
		
		model.addAttribute("sortField", sortField);
		model.addAttribute("sortDir", sortDir);
		model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");
		
		model.addAttribute("listProduct", listProduct);
		return "list_product";
	}
}
