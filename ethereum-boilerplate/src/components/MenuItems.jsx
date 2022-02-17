import { useLocation } from "react-router";
import { Menu } from "antd";
import { NavLink } from "react-router-dom";

function MenuItems() {
  const { pathname } = useLocation();

  return (
    <Menu
      theme="light"
      mode="horizontal"
      style={{
        display: "flex",
        fontSize: "17px",
        fontWeight: "500",
        width: "100%",
        justifyContent: "center",
      }}
      defaultSelectedKeys={[pathname]}
    >
      <Menu.Item key="/gen">
        <NavLink to="/gen">👛 Gen NFT</NavLink>
      </Menu.Item>
      <Menu.Item key="/engine">
        <NavLink to="/engine">🏦 Get an Engine</NavLink>
      </Menu.Item>
      <Menu.Item key="shell">
        <NavLink to="/shell">💵 Get Shell</NavLink>
      </Menu.Item>
      <Menu.Item key="/balance">
        <NavLink to="/balance">💰 Ship Balances</NavLink>
      </Menu.Item>
      {/* <Menu.Item key="/erc20transfers">
        <NavLink to="/erc20transfers">💸 Transfers</NavLink>
      </Menu.Item> */}
    </Menu>
  );
}

export default MenuItems;
