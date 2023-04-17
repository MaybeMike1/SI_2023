import { useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import "./App.css";
import { Auth0Provider, useAuth0 } from "@auth0/auth0-react";
import Profile from "./components/Profile";

function App() {
  const { loginWithRedirect } = useAuth0();
  const { isAuthenticated } = useAuth0();

  return (
    <div>
      {isAuthenticated ? (
        <Profile />
      ) : (
        <button
          onClick={() => {
            loginWithRedirect();
          }}
        >
          Login
        </button>
      )}
    </div>
  );
}

export default App;
