import React, { useState } from "react";
import { FiCopy, FiCheck } from "react-icons/fi";

export default function CommandModal({ open, subsection, onClose }) {
  const [copiedIndex, setCopiedIndex] = useState(null);

  if (!open || !subsection) return null;

  const handleCopy = (command, idx) => {
    navigator.clipboard.writeText(command);
    setCopiedIndex(idx);
    setTimeout(() => setCopiedIndex(null), 1200);
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal-content" onClick={e => e.stopPropagation()}>
        <button className="modal-close" onClick={onClose}>&times;</button>
        <h2>{subsection.name}</h2>
        <div className="commands-scrollable">
          {Array.isArray(subsection.commands) && subsection.commands.length > 0 ? (
            subsection.commands.map((cmd, idx) => (
              <div className="command-row" key={cmd.label}>
                <span className="command-label">{cmd.label}</span>
                <span className="command-text">{cmd.command}</span>
                <button
                  className="copy-btn"
                  onClick={() => handleCopy(cmd.command, idx)}
                  title="Copy command"
                >
                  {copiedIndex === idx
                    ? <FiCheck color="green" />
                    : <FiCopy />}
                </button>
                {copiedIndex === idx && (
                  <span style={{
                    marginLeft: "8px",
                    color: "#3f993f",
                    fontWeight: 500,
                    fontSize: "0.97em"
                  }}>Copied!</span>
                )}
              </div>
            ))
          ) : (
            <div>No commands available.</div>
          )}
        </div>
      </div>
    </div>
  );
}