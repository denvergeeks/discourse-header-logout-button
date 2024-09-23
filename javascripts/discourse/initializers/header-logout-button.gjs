import { h } from "virtual-dom";
import { withPluginApi } from "discourse/lib/plugin-api";
import { iconNode } from "discourse-common/lib/icon-library";
import I18n from "I18n";
import DButton from "discourse/components/d-button";
import { apiInitializer } from "discourse/lib/api";
import User from "discourse/models/user";  // Import the User model

export default apiInitializer("1.0", (api) => {
      const currentUser = api.container.lookup("service:current-user");
        if (currentUser !== null) {
         api.headerIcons.add("header-logout-button",
          <template>
            <li class="header-logout-button header-dropdown-toggle">
              <DButton @action={{route-action "logout"}}>
                <span class="btn-primary btn-small">
                  <span>
                    {{i18n "user.log_out"}}
                  </span>
                  <span>
                    {{d-icon "sign-out-alt"}}
                  </span>
                </span>
              </DButton>
            </li>
          </template>);
  }
});
