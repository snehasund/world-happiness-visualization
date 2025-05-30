import React, { useState } from 'react';
import scatterplot from './images/scatterplot.png';
import barplot from './images/barplot.png';
import boxplot from './images/boxplot.png';
import densityplot from './images/densityplot.png';
import './App.css';

const images = [
  { src: scatterplot, alt: "Scatterplot" },
  { src: barplot, alt: "Barplot" },
  { src: boxplot, alt: "Boxplot" },
  { src: densityplot, alt: "Density Plot" }
];

function App() {
  const [enlargedIndex, setEnlargedIndex] = useState(null);

  const handleClick = (index) => {
    setEnlargedIndex(index === enlargedIndex ? null : index);
  };

  return (
    <div className="App">
      <header className="App-header">
        <h1>Visualizations of the World Happiness Report</h1>
        <div className="card-container">
          {images.map((img, index) => (
            <div
              key={index}
              className={`plot-card ${enlargedIndex === index ? 'enlarged' : ''}`}
              onClick={() => handleClick(index)}
            >
              <img className="graph-image" src={img.src} alt={img.alt} />
              <p>{img.alt}</p>
            </div>
          ))}
        </div>

        {enlargedIndex !== null && (
          <div className="overlay" onClick={() => setEnlargedIndex(null)}>
            <img
              src={images[enlargedIndex].src}
              alt={images[enlargedIndex].alt}
              className="overlay-image"
            />
          </div>
        )}
      </header>
    </div>
  );
}

export default App;
