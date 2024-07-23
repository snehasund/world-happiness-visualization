import React from 'react';
import worldHappinessImage from './images/world-happiness-visualization.png';
import './App.css'; // Ensure the CSS file is correctly imported

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>Visualization of the World Happiness Report</h1>
        <div className="card-container">
          <div className="card">
            <img class="graph-image" src={worldHappinessImage} alt="World Happiness Visualization" />
          </div>
        </div>
      </header>
    </div>
  );
}

export default App;
