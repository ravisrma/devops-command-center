import React from "react";

export default function ThemeToggle({ theme, setTheme }) {
  return (
    <button
      className="theme-toggle"
      onClick={() => setTheme(theme === "light" ? "dark" : "light")}
      title="Toggle dark mode"
    >
      {theme === "light" ? "🌙 Dark" : "🌞 Light"}
    </button>
  );
}