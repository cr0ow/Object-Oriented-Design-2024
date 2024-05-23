import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter, Routes, Route } from "react-router-dom";
import './index.css';
import reportWebVitals from './reportWebVitals';
import Services from "./components/Services";
import Cart from "./components/Cart";
import Payments from "./components/Payments";
import {CartProvider} from "./components/CartContext";

function App(){
    return (
        <>
            <BrowserRouter>
                <CartProvider>
                    <Routes>
                        <Route path="/" element={<Services />} />
                        <Route path="/cart" element={<Cart />} />
                        <Route path="/payments" element={<Payments />} />
                    </Routes>
                </CartProvider>
            </BrowserRouter>
        </>
    );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

reportWebVitals();
