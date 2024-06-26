// Function to add a product to the cart
function add_to_cart(pid, pname, price){
    let cart = localStorage.getItem("cart");
    if(cart == null){
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("Product added for the first time");
    } else {
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == pid);
        if(oldProduct){
            oldProduct.productQuantity++;
        } else {
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
            pcart.push(product);
        }
        localStorage.setItem("cart", JSON.stringify(pcart));
        console.log("Product added");
    }
    updateCart();
}

// Function to update the cart display
function updateCart(){
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if(cart == null || cart.length == 0){
        console.log("Cart is empty");
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h3>Cart does not exist</h3>");
        $(".checkout-btn").attr('disabled', true);
    } else {
        console.log(cart);
        $(".cart-items").html(`( ${cart.length} )`);
        let table = `
            <table class='table'>
                <thead class='thread-light'>
                    <tr>
                        <th>Item Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
            `;
        let totalPrice = 0;
        cart.map((item) => {
            table += `
                <tr>
                    <td>${item.productName}</td>
                    <td>${item.productPrice}</td>
                    <td>${item.productQuantity}</td>
                    <td>${item.productQuantity * item.productPrice}</td>
                    <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
                </tr>
            `;
            totalPrice += item.productPrice * item.productQuantity;
        });
        table += `
            <tr>
                <td colspan='5' class="text-right font-weight-bold m-5">Total Price: ${totalPrice}</td>
            </tr>
        </table>`;
        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled', false);
        console.log("Cart updated");
    }
}

// Function to delete an item from the cart
function deleteItemFromCart(pid){
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newcart = cart.filter((item) => item.productId != pid);
    localStorage.setItem('cart', JSON.stringify(newcart));
    updateCart();
}

// Event listener to update cart on page load
$(document).ready(function () {
    updateCart();
});

// Event listener to handle checkout button click
function goToCheckout(){
    window.location = "checkout.jsp";
}