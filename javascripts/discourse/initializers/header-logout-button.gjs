import { h } from "virtual-dom";
import { withPluginApi } from "discourse/lib/plugin-api";
import { iconNode } from "discourse-common/lib/icon-library";
import I18n from "discourse-lib/i18n"; // Adjust import based on your setup
import { apiInitializer } from "discourse/lib/api";

export default apiInitializer("1.0", (api) => {
  const currentUser = api.getCurrentUser();
  
  if (currentUser) {
    api.headerIcons.add("header-logout-button", () => {
      return h("li", { className: "header-logout-button header-dropdown-toggle" }, [
        h("button", {
          className: "btn-primary btn-small",
          onclick() {
            api.container.lookup("router:main").send("logout");
          },
        }, [
          h("span", I18n.t("user.log_out")),
          iconNode("sign-out-alt")
        ])
      ]);
    });
  }

  // Registering a value transformer for any dynamic use cases for the logout button
  api.registerValueTransformer("header-logout-button-href", () => {
    return currentUser ? `/logout` : `/login`;
  });
});
