var dates = {
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
    dates.product = e.getAttribute("product");
    dates.btn = e;
    fetch('/my_shopping_carts/',
      {
        method: 'POST',
        headers: {           
          'X-CSRF-Token': dates.token,
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body:
          JSON.stringify(
            {
              "product_id":dates.product
            }
          )
      }
    )
    .then( response => {
      dates.status = response.clone().status
      return response.json()
    })
    .then( response => {
      dates.response = response 
      if(dates.status == 200){
        document.getElementById('mycart').textContent = response.cart;
        ap_accions.toast_alert("success", dates.response.response, 2000)
      } else {
        ap_accions.toast_alert("error", response.products[0] , 2000)
      }
    })
    .catch(console.log)
  },
  addFav (e){
    dates.product = e.getAttribute("product");
    dates.btn = e;
    fetch('/favorites/',
      {
        method: 'POST',
        headers:{
          'X-CSRF-Token': dates.token,
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(
          {
            "product_id":dates.product 
          }
        )
      },
    ).then( result => {
      dates.status = result.clone().status // 200 o 400
      return result.json()
    })
    .then( result => {
      dates.result = result 
      if(dates.status == 200){
        ap_accions.toast_alert("success", dates.result.response, 2000)
      } else {
        ap_accions.toast_alert("error", result.favorites[0], 2000)
      }
    })
    .catch(console.log)
  },
  deleteItem(e,fila){
    dates.total   = parseInt(document.getElementById('mycartTotal').textContent)
    dates.product = parseInt(e.getAttribute("product"))
    dates.element = document.getElementById("p_" + fila)
    fetch('/my_shopping_carts/' + fila,
      {
        method: 'DELETE',
        headers: {           
          'X-CSRF-Token': dates.token,
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body:
          JSON.stringify(
            {
              "cart_id":dates.cart_id
            }
          )
      }
    )
    .then( response => {
      dates.status = response.clone().status
      return response.json()
    })
    .then( response => {
      if(dates.status == 200){
        dates.product = response.product
        if (response.update_cart == 0)
          dates.element.style.display = "none"        
        else
          dates.element.children[2].textContent = response.update_cart
        document.getElementById('mycartTotal').textContent = parseFloat(dates.total - dates.product.p_price)
        document.getElementById('mycart').textContent = response.cart;
        ap_accions.toast_alert("success", response.response, 500)
      } else {
        ap_accions.toast_alert("error", response.products[0], 1000)
      }
    })
    .catch(console.log)

  },
  deleteFavorite(e,fila){
    dates.product = parseInt(e.getAttribute("product"))
    dates.element = document.getElementById("p_" + fila)
    fetch('/favorites/' + fila,
      {
        method: 'DELETE',
        headers: {           
          'X-CSRF-Token': dates.token,
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        }
      }
    )
    .then( response => {
      dates.status = response.clone().status
      return response.json()
    })
    .then( result => {
      if(dates.status == 200){
        ap_accions.toast_alert("success", result.response, 1000)
        dates.element.style.display = "none"
      } else {
        ap_accions.toast_alert("error", result.products[0], 1000)        
      }
    })
    .catch(console.log)
  }
}

$(document).ready(function(){
  dates.cart = parseInt(document.getElementById("mycart").textContent)
})