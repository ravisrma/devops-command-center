import React from "react";

function Sidebar({ sections, onSectionClick, onSubsectionClick, selectedSection, theme }) {
  return (
    <nav className={`sidebar${theme === 'dark' ? ' dark' : ''}`}>
      <div className="sidebar-item" onClick={() => onSectionClick(null)}>
        🏠 Home
      </div>
      {sections.map((section) => (
        <div key={section.name}>
          <div
            className={`sidebar-section${selectedSection === section ? " active" : ""}`}
            onClick={() => onSectionClick(section)}
          >
            {section.name}
          </div>
          {selectedSection === section && section.subsections && (
            <div className="sidebar-subsections">
              {section.subsections.map((sub) => (
                <div
                  key={sub.name}
                  className="sidebar-subsection"
                  onClick={() => onSubsectionClick(sub)}
                >
                  - {sub.name}
                </div>
              ))}
            </div>
          )}
        </div>
      ))}
    </nav>
  );
}

export default Sidebar;