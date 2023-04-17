import { useAuth0 } from "@auth0/auth0-react";
import { motion } from "framer-motion";
import React from 'react';

const Profile: React.FC = () => {
  const { user, isAuthenticated, isLoading } = useAuth0();
  const {logout} = useAuth0();

  if(!user){
    <>No user logged in</>
  }

  if (isLoading) {
    return <>Loading...</>;
  }
  console.log(user);
  
  return (
    isAuthenticated && user ? (
    <motion.div
        initial={{scale: 1,rotate: 160}}
        animate={{rotate: 360, scale: 1}}
        transition= {{
            type: 'spring',
            stiffness: 260,
            damping: 20
        }}
    >
      <img style={{}} src={user.picture} alt={user.name} />
      <h2>{user.name}</h2>
      <p>Email: {user.email ? user.email : "Not set"}</p>
      <p>Email Verification: {user.email_verified ? "Verified" : "Not Verified"}</p>
      <p>Phone Verification: {user.phone_number_verified ? "Verified" : "Not Verified"}</p>
      <p>Phone Number: {user.phone_number ? user.phone_number : "Not set"}</p>
      <p>Last Updated: {user.updated_at}</p>
      <button onClick={() => logout({logoutParams: {returnTo: window.location.origin}})}>Logout</button>
    </motion.div>
  ) : <>Not Logged in</>
  );
};

export default Profile;