import React, { Component } from 'react';
import {BrowserRouter as Router} from 'react-router-dom';
import logo from './logo.svg';
import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import './fontawesome-free-5.12.1-web/css/all.min.css'
import Navbar from './components/Navbar'
import ProductList from './components/ProductList'
import Details from './components/Details'
import Cart from './components/Cart'
import Default from './components/Default'
import { Switch, Route } from 'react-router-dom';

class App extends Component {
  state = {
    produits: []
  }
  render () {
  return (
    <React.Fragment>
      <Navbar></Navbar>
      <Switch>
        <Route path="/" component={ProductList}></Route>
        <Route path="/details" component={Details}></Route>
        <Route path="/cart" component={Cart}></Route>
        <Route component={Default}></Route>
      </Switch>>
    </React.Fragment>
    );
  }
}

export default App;
