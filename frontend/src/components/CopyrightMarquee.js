import React from "react";
import "./CopyrightMarquee.css";

export default function CopyrightMarquee() {
  return (
    <div className="copyright-marquee">
      <span>
        &copy; {new Date().getFullYear()} Ravisharma &mdash; All Rights Reserved &mdash; Best Ongoing Copyright
      </span>
    </div>
  );
}