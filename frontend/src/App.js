import React, { useEffect, useState } from 'react';
import SectionCards from './components/SectionCards';
import CommandModal from './components/CommandModal';
import ThemeToggle from './components/ThemeToggle';
import SocialHeader from './components/SocialHeader'; // <-- Add this import
import CopyrightMarquee from './components/CopyrightMarquee'; // <-- Add this import
import './App.css';

function App() {
  const [sections, setSections] = useState([]);
  const [selectedSubsection, setSelectedSubsection] = useState(null);
  const [modalOpen, setModalOpen] = useState(false);
  const [theme, setTheme] = useState('light');

  useEffect(() => {
    // Change URL if needed
    fetch('http://localhost:8000/api/sections')
      .then(res => res.json())
      .then(setSections)
      .catch(() => setSections([]));
  }, []);

  useEffect(() => {
    document.body.className = theme;
  }, [theme]);

  return (
    <>
      <SocialHeader /> {/* <-- Add this line at the top */}
      <div className="app-container">
        <div className="main-content">
          <ThemeToggle theme={theme} setTheme={setTheme} />
          <SectionCards
            sections={sections}
            onSubsectionClick={sub => { setSelectedSubsection(sub); setModalOpen(true); }}
          />
        </div>
        <CommandModal
          open={modalOpen}
          subsection={selectedSubsection}
          onClose={() => setModalOpen(false)}
        />
      </div>
      <CopyrightMarquee /> {/* <-- Add this line at the bottom */}
    </>
  );
}

export default App;