import CategoryPage from "../pages/category"
import NotFound from "../pages/errors/404"
import HomePage from "../pages/home"
import ProductPage from "../pages/product"
import AdminCategoryPage from "../pages/admin/category/AdminCategoryPage";
import AdminProductPage from "../pages/admin/product/AdminProductPage";
import AdminUserPage from "../pages/admin/user/AdminUserPage";
import AdminTransactionPage from "../pages/admin/transaction/AdminTransactionPage";
import AccountPage from "../pages/account/AccountPage";
import OrderPage from "../pages/account/OrderPage";
import ProfilePage from "../pages/account/ProfilePage";
import LoginPage from "../pages/auth/LoginPage";
import RegisterPage from "../pages/auth/RegisterPage";
import SearchPage from "../pages/search";
import CartPage from "../pages/cart/CartPage";
import UpdateProductPage from "../pages/admin/product/UpdateProductPage";
import UpdateCategoryPage from "../pages/admin/category/UpdateCategoryPage";
import CreateCategoryPage from "../pages/admin/category/CreateCategoryPage";
import MenuPage from "../pages/blog/menu";
import ArticlePage from "../pages/blog/article";

export const routes = () => {
    return [
        {
            path: "/",
            element: <HomePage />,
            index: true,
            exact: true
        },
        {
            path: "/san-pham",
            element: <CategoryPage />,
        },
        {
            path: "/search",
            element: <SearchPage />,
        },
        {
            path: "/cart",
            element: <CartPage />,
        },
        {
            path: "/danh-muc",
            children: [
                {
                    path: ":slug",
                    // path: ":slug-:id",
                    element: <CategoryPage />,
                },
                {
                    path: "*",
                    element: <CategoryPage />,
                }
            ]
        },
        {
            path: "/tin-tuc-chuyen-muc",
            children: [
                {
                    path: ":slug",
                    element: <MenuPage />,
                },
                {
                    path: "*",
                    element: <MenuPage />,
                }
            ]
        },
        {
            path: "/bai-viet",
            children: [
                {
                    path: ":slug",
                    element: <ArticlePage />,
                },
                {
                    path: "*",
                    element: <ArticlePage />,
                }
            ]
        },
        {
            path: '/san-pham/:slug',
            element: <ProductPage />
        },
        // Route admin
        {
            path: "/admin",
            children: [
                {
                    path: "category",
                    children: [
                        {
                            path: "",
                            element: <AdminCategoryPage />,
                        },
                        {
                            path: "create",
                            element: <CreateCategoryPage />,
                        },
                        {
                            path: "edit/:id",
                            element: <UpdateCategoryPage />,
                        },
                        {
                            path: "*",
                            element: <AdminCategoryPage />,
                        }
                    ]
                },
                {
                    path: "product",
                    children: [
                        {
                            path: "",
                            element: <AdminProductPage />,
                        },
                        {
                            path: "edit/:id",
                            element: <UpdateProductPage />,
                        },
                        {
                            path: "*",
                            element: <AdminProductPage />,
                        }
                    ]
                },
                {
                    path: "user",
                    element: <AdminUserPage />,
                },
                {
                    path: "transaction",
                    element: <AdminTransactionPage />,
                },
            ]
        },
        {
            path: "/account",
            children: [
                {
                    path: "",
                    element: <AccountPage />,
                },
                {
                    path: "order",
                    element: <OrderPage />,
                },
                {
                    path: "profile",
                    element: <ProfilePage />,
                },
            ]
        },
        {
            path: "/auth",
            children: [
                {
                    path: "login",
                    element: <LoginPage />,
                },
                {
                    path: "register",
                    element: <RegisterPage />,
                }
            ]
        },
        {
            path: '*',
            element: <NotFound />
        },
    ]
}
