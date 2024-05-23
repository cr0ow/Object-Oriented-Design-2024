import React, {useEffect, useState} from 'react';
import axios from 'axios';
import {useCart} from "./CartContext";

function Services() {

    const [services, setServices] = useState([]);
    const { addToCart, redirect } = useCart();

    useEffect( () => {
        async function fetchServices() {
            try {
                const res = await axios.get('http://localhost:8080/services');
                setServices(res.data);
            } catch (err) {
                console.log(err);
            }
        }
        fetchServices();
    }, []);

    return (
        <>
            <h1>Services</h1>
            <ul>
                {
                    services.map(((service, index) => {
                        return (<li key={service.id}>{service.name}, {service.price} PLN <button
                            onClick={() => addToCart(service)}>Add to cart</button></li>);
                    }))
                }
            </ul>
            <button id='cartButton' onClick={() => redirect('/cart')}>Cart</button>
        </>
    );
}

export default Services;
