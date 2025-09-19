import React from "react";

function SubsectionList({ section, onBack, onSubsectionClick }) {
  return (
    <div>
      <button className="back-btn" onClick={onBack}>← Back to Sections</button>
      <h2>{section.name}</h2>
      <ul className="subsection-list">
        {section.subsections.map((sub) => (
          <li key={sub.name}>
            <button className="subsection-link" onClick={() => onSubsectionClick(sub)}>
              {sub.name}
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default SubsectionList;