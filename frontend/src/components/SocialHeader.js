import React from "react";
import { FaLinkedin, FaGithub, FaInstagram } from "react-icons/fa";

const socialLinks = [
  {
    icon: <FaLinkedin color="#0077b5" />,
    url: "https://linkedin.com/in/ravisharma",
    label: "LinkedIn"
  },
  {
    icon: <FaGithub color="#333" />,
    url: "https://github.com/ravisrma",
    label: "GitHub"
  },
  {
    icon: <FaInstagram color="#e1306c" />,
    url: "https://instagram.com/itsravisrma",
    label: "Instagram"
  }
];

export default function SocialHeader() {
  return (
    <div style={{
      display: "flex",
      justifyContent: "flex-end",
      alignItems: "center",
      gap: "24px",
      padding: "12px 32px 0 0",
      background: "none"
    }}>
      {socialLinks.map(link => (
        <a
          href={link.url}
          key={link.label}
          target="_blank"
          rel="noopener noreferrer"
          title={link.label}
          style={{
            fontSize: "1.9em",
            transition: "transform 0.2s",
            textDecoration: "none"
          }}
        >
          {link.icon}
        </a>
      ))}
    </div>
  );
}