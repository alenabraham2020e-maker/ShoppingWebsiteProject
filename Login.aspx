<%@ Page Title="" Language="C#" MasterPageFile="~/s1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
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
                  <div class="btn-left">
                  </div>
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
                  <div class="btn-left">
                  </div>
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
                  <div class="btn-left">
                  </div>
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
            <h4 class="text-center mb-4">Login</h4>
            <div class="mb-3">
              <asp:Label ID="lblUsername" runat="server" Text="Username" CssClass="form-label"></asp:Label>
              <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
              <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="form-label"></asp:Label>
              <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="d-grid mb-2">
              <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
            </div>
            <div class="text-center">
              <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </div>
          </div>
        </div>
      </div>

    </div>
  </section>
</asp:Content>