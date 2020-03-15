import React, { Component } from "react";
import Product from "./Product";
import Title from "./Title";
import { storeProducts } from "../data";
import styled from "styled-components";
import { ProductConsumer } from "../contextt";
export default class Prod3 extends Component {
  state = {
    products: storeProducts,
    produits: []
  };
  componentDidMount() {
      var myHeaders = new Headers();
      myHeaders.append('accept', 'application/json')

      var myInit = { method: 'GET',
                  headers: myHeaders,
                  mode: 'cors',
                  cache: 'default' };
      fetch('http://localhost:8000/api/carte_graphique', myInit)
      .then(res => res.json())
      .then((data) => {
        this.setState({ produits: data })
      })
      // console.log(this.state.produits)
      // .catch(console.log)
  }
  render() {
    return (
      <React.Fragment>
        <ProductWrapper className="py-5">
          <div className="container">
            <Title name="our" title="carte graphiques" />
            <div className="row">
              <ProductConsumer>
                {() => {
                  return this.state.produits.map(product => {
                    return <Product key={product.id} product={product} />;
                  });
                }}
              </ProductConsumer>
            </div>
          </div>
        </ProductWrapper>
      </React.Fragment>
    );
  }
}

const ProductWrapper = styled.section``;