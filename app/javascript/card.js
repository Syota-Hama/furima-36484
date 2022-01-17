const pay = () => {
  Payjp.setPublicKey("pk_test_39d53e2d092d874ec92cdfb9");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_address[number]"),
      cvc: formData.get("order_address[cvc]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("input-default");
      document.getElementById("card-cvc").removeAttribute("input-default");
      document.getElementById("card-exp-month").removeAttribute("input-expiration-date");
      document.getElementById("card-exp-year").removeAttribute("input-expiration-date");

      document.getElementById("charge-form").submit();
    });
  });
};


window.addEventListener("load", pay);