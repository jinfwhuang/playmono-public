import * as React from "react";
import * as ReactDOM from "react-dom";
import * as styles from "./styles.css";

const { useState } = React;

const App = () => {
  const [value, setValue] = useState('default value');
  const handleChange = (e) => setValue(e.target.value);
  return (
    <div>
      <textarea
        style={{
          width: "350px",
          height: "100px",
        }}
        value={value} 
        onChange={handleChange} 
        />
      <p>{value}</p>
    </div>
  );
};

// type="text" 
// {/* <input style="width: 200px; height: 200px;" */}

ReactDOM.render(
  (<div>
    <h1 className={styles.h1}>Hello, world!</h1>
    <App />

  </div>),

  // <MyElement />
  document.getElementById("root")
);



