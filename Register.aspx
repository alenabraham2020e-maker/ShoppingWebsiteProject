<%@ Page Title="" Language="C#" MasterPageFile="~/s1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="billboard" class="bg-light py-5">
  <div class="container">
    <div class="row justify-content-center">
      <h1 class="section-title text-center mt-4" data-aos="fade-up">Welcome</h1>
      <div class="col-md-6 text-center" data-aos="fade-up" data-aos-delay="300">
      </div>
    </div>
    <div class="row">
      <div class="swiper main-swiper py-4" data-aos="fade-up" data-aos-delay="600">
        <div class="swiper-wrapper d-flex border-animation-left">
          <div class="swiper-slide">
            <div class="banner-item image-zoom-effect">
              <div class="image-holder">
                <a href="#">
                  <img src="images/banner-image-6.jpg" alt="product" class="img-fluid">
                </a>
              </div>
              <div class="banner-content py-4">
                <h5 class="element-title text-uppercase">
                  <a href="single-product.html" class="item-anchor">Premium Wear</a>
                </h5>
              </div>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="banner-item image-zoom-effect">
              <div class="image-holder">
                <a href="#">
                  <img src="images/banner-image-1.jpg" alt="product" class="img-fluid">
                </a>
              </div>
              <div class="banner-content py-4">
                <h5 class="element-title text-uppercase">
                  <a href="single-product.html" class="item-anchor">Everyday Fashion</a>
                </h5>
              </div>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="banner-item image-zoom-effect">
              <div class="image-holder">
                <a href="#">
                  <img src="images/banner-image-2.jpg" alt="product" class="img-fluid">
                </a>
              </div>
              <div class="banner-content py-4">
                <h5 class="element-title text-uppercase">
                  <a href="single-product.html" class="item-anchor">Exclusive Styles</a>
                </h5>
              </div>
            </div>
          </div>
        </div>
        <div class="swiper-pagination"></div>
      </div>
    </div>

    <div class="row justify-content-center mt-5">
      <div class="col-md-4">
        <div class="card p-4 shadow-sm">
          <div class="mb-3">
            <asp:Label ID="lblRole" runat="server" Text="Register as" CssClass="form-label"></asp:Label>
            <asp:RadioButtonList ID="rblRole" runat="server" RepeatDirection="Vertical" CssClass="form-control border-0">
              <asp:ListItem Text="User" Value="User" Selected="True"></asp:ListItem>
              <asp:ListItem Text="Seller" Value="Seller"></asp:ListItem>
            </asp:RadioButtonList>
          </div>
          <div class="d-grid mb-2">
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
          </div>
        </div>
      </div>
    </div>

  </div>
</section>
</asp:Content>