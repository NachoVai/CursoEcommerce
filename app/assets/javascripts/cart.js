var data = {
  token: document.getElementsByName('csrf-token')[0].content,
  product: null,
  btn: null,
  message: "",
  cart: null,
  status: 0,
  response: null,
  element: null,
  total: null
}

var actions = {
  addCart (e){
    data.product = e.getAttribute("product");
    data.btn = e;
    fetch('/my_shopping_carts/',
      {
        method: 'POST',
        headers: {           
          'X-CSRF-Token': data.token,
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body:
          JSON.stringify(
            {
              "product_id":data.product
            }
          )
      }
    )
    .then( response => {
      data.status = response.clone().status
      return response.json()
    })
    .then( response => {
      data.response = response 
      if(data.status == 200){
        document.getElementById('mycart').textContent = response.cart;
        ap_accions.toast_alert("success", data.response.response, 2000)
      } else {
        ap_accions.toast_alert("error", response.products[0] , 2000)
      }
    })
    .catch(console.log)
  },
  addFav (e){
    data.product = e.getAttribute("product");
    data.btn = e;
    fetch('/favodata/',
      {
        method: 'POST',
        headers:{
          'X-CSRF-Token': data.token,
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(
          {
            "product_id":data.product 
          }
        )
      },
    ).then( result => {
      data.status = result.clone().status // 200 o 400
      return result.json()
    })
    .then( result => {
      data.result = result 
      if(data.status == 200){
        ap_accions.toast_alert("success", data.result.response, 2000)
      } else {
        ap_accions.toast_alert("error", result.favodata[0], 2000)
      }
    })
    .catch(console.log)
  },
  deleteItem(e,fila){
    data.total   = parseInt(document.getElementById('mycartTotal').textContent)
    data.product = parseInt(e.getAttribute("product"))
    data.element = document.getElementById("p_" + fila)
    fetch('/my_shopping_carts/' + fila,
      {
        method: 'DELETE',
        headers: {           
          'X-CSRF-Token': data.token,
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body:
          JSON.stringify(
            {
              "cart_id":data.cart_id
            }
          )
      }
    )
    .then( response => {
      data.status = response.clone().status
      return response.json()
    })
    .then( response => {
      if(data.status == 200){
        data.product = response.product
        if (response.update_cart == 0)
          data.element.style.display = "none"        
        else
          data.element.children[2].textContent = response.update_cart
        document.getElementById('mycartTotal').textContent = parseFloat(data.total - data.product.p_price)
        document.getElementById('mycart').textContent = response.cart;
        ap_accions.toast_alert("success", response.response, 500)
      } else {
        ap_accions.toast_alert("error", response.products[0], 1000)
      }
    })
    .catch(console.log)

  },
  deleteFavorite(e,fila){
    data.product = parseInt(e.getAttribute("product"))
    data.element = document.getElementById("p_" + fila)
    fetch('/favodata/' + fila,
      {
        method: 'DELETE',
        headers: {           
          'X-CSRF-Token': data.token,
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        }
      }
    )
    .then( response => {
      data.status = response.clone().status
      return response.json()
    })
    .then( result => {
      if(data.status == 200){
        ap_accions.toast_alert("success", result.response, 1000)
        data.element.style.display = "none"
      } else {
        ap_accions.toast_alert("error", result.products[0], 1000)        
      }
    })
    .catch(console.log)
  }
}

$(document).ready(function(){
  data.cart = parseInt(document.getElementById("mycart").textContent)
})