import React from "react";
import "./style.css";

export const LogOnPage = () => {
  return (
    <div className="log-on-page">
      <div className="page-content">
        <div className="title-group">
          <p className="rhiannon-baker">
            <span className="text-wrapper">R</span>

            <span className="span">hiannon Baker</span>
          </p>

          <div className="div">Technology Specialist</div>
        </div>

        <p className="p">
          Access my web based portfolio and explore the skills I bring to your
          team.
        </p>

        <div className="btn-signin">
          <div className="rectangle" />

          <div className="text-wrapper-2">Sign in</div>
        </div>

        <div className="text-wrapper-3">OR</div>

        <div className="btn-requestaccess">
          <div className="rectangle-2" />

          <div className="text-wrapper-4">Request Access</div>
        </div>
      </div>

      <p className="copyright">
        Copy right Rhiannon Baker 2026 - Professional Portfolio
      </p>
    </div>
  );
};

export default LogOnPage;
