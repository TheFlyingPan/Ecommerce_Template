import React, { Component } from 'react'
import styled from 'styled-components'
import {Link} from 'react-router-dom'
import {ProductConsumer} from '../contextt'

export default class Product extends Component {
    state = {
        produits: []
    }

    componentDidMount() {
        var myHeaders = new Headers();
        myHeaders.append('accept', 'application/json')

        var myInit = { method: 'GET',
                    headers: myHeaders,
                    mode: 'cors',
                    cache: 'default' };
        fetch('http://localhost:8000/api/produit_index', myInit)
        .then(res => res.json())
        .then((data) => {
          this.setState({ produits: data })
        })
        console.log(this.state.produits)
        // .catch(console.log)
    }

    render() {
        const {id, title, img, price, inCart} = this.props.product;
        return (
            <ProductWrapper className="col-9 mx-auto col-md-6 col-lg-3 my-3">
                <div className="card">
                    <div className="img-container p-5" onClick={() => console.log('you click me on image container')}>
                        <Link to="/details">
                            <img src={img} alt="product" className="card-img-top"></img>
                        </Link>
                        <button className="cart-btn" disabled={inCart?true: false} onClick={()=>{console.log('added to the cart');
                    }}>
                        {inCart?(<p className="text-capitalize mb-0" disababled>in Cart</p>):
                        (<i className="fas fa-cart-plus"></i>)}
                        </button>
                    </div>
                </div>
            </ProductWrapper>
        );
    }
}

const ProductWrapper = styled.div`
`