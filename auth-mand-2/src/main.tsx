import { Auth0Provider } from '@auth0/auth0-react'
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'
import './index.css'

ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render(
  <React.StrictMode>
     <Auth0Provider
      domain="dev-fpxy56qptb1sd2sk.eu.auth0.com"
      clientId="4SamChzbCcaE6Xb0MBeKS2DU6b831F3E"
      authorizationParams={{
        redirect_uri: "https://1bed-2a02-aa7-4007-318a-b839-e1d7-4fb6-2448.ngrok-free.app",
      }}
    >
    <App />
    </Auth0Provider>
  </React.StrictMode>,
)
