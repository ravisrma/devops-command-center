import React from "react";
import { FiMonitor } from "react-icons/fi";
import { FaDocker, FaGitAlt, FaCloud, FaShieldAlt, FaChartBar } from "react-icons/fa";
import { SiTerraform, SiAnsible, SiJenkins, SiKubernetes, SiHelm, SiPrometheus, SiElasticstack } from "react-icons/si";
import { MdOutlineQueryStats } from "react-icons/md";
import { BsFolder2Open } from "react-icons/bs";

// Colorful icon map
const sectionIcons = {
  "Linux & System": <FiMonitor color="#4f8ef7" />, // blue
  "Containerization": <FaDocker color="#2496ed" />, // docker blue
  "Automation & IaC": <SiTerraform color="#7b42bc" />, // terraform purple
  "SCM & CI/CD": <FaGitAlt color="#f34f29" />, // git orange
  "Cloud": <FaCloud color="#3cba92" />, // greenish
  "Monitoring & Logging": <MdOutlineQueryStats color="#ffb300" />, // yellow
  "Security": <FaShieldAlt color="#2d8cff" />, // blue shield
};

export default function SectionCards({ sections, onSubsectionClick }) {
  return (
    <div className="section-cards">
      {/* Amazing image above title (use your own image link if preferred) */}
      <img
        src="https://images.unsplash.com/photo-1461749280684-dccba630e2f6?auto=format&fit=crop&w=900&q=80"
        alt="DevOps"
        style={{
          width: "120px",
          borderRadius: "18px",
          margin: "0 auto 1em auto",
          display: "block",
          boxShadow: "0 2px 12px #0002"
        }}
      />
      <h1 style={{
        fontFamily: "inherit",
        fontSize: "2.7rem",
        fontWeight: 700,
        marginBottom: "1em"
      }}>DevOps Command Center</h1>
      <div className="cards-grid">
        {sections.map((section) => (
          <div key={section.name} className="section-card">
            <div className="section-icon" style={{ fontSize: "2.2em", marginBottom: 12 }}>
              {sectionIcons[section.name] || <BsFolder2Open color="#f7bc3c" />}
            </div>
            <div className="section-title" style={{
              fontWeight: "bold",
              marginBottom: "1em",
              textAlign: "center"
            }}>
              {section.name}
            </div>
            {Array.isArray(section.subsections) && (
              <div className="subsection-list">
                {section.subsections.map((sub) => (
                  <button
                    key={sub.name}
                    className="subsection-link"
                    onClick={() => onSubsectionClick(sub)}
                  >
                    {sub.name}
                  </button>
                ))}
              </div>
            )}
          </div>
        ))}
      </div>
    </div>
  );
}