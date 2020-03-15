import React, { Component } from "react";
import "./App.css";
import "bootstrap/dist/css/bootstrap.min.css";
import { Route, Switch } from "react-router-dom";
import Navbar from "./components/Navbar";
import ProductList from "./components/ProductList";
import Details from "./components/Details";
import Default from "./components/Default";
import Cart from "./components/Cart";
import Modal from "./components/Modal";
import Prod1 from "./components/Prod1";
import Prod2 from "./components/Prod2";
import Prod3 from "./components/Prod3";
import Prod4 from "./components/Prod4";
class App extends Component {
  render() {
    return (
      <React.Fragment>
        <Navbar />
        <Switch>
          <Route exact path="/" component={ProductList} />
          <Route path="/prod1" component={Prod1} />
          <Route path="/prod2" component={Prod2} />
          <Route path="/prod3" component={Prod3} />
          <Route path="/prod4" component={Prod4} />
          <Route path="/details" component={Details} />
          <Route path="/cart" component={Cart} />
          <Route component={Default} />
        </Switch>
        <Modal />
      </React.Fragment>
    );
  }
}

export default App;