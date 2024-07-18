// TopNavigation.js
import React from 'react';
import { Menu, MenuItem, MenuList, MenuPopover, MenuTrigger, Button, Avatar, Toolbar, ToolbarItem } from '@fluentui/react-components';

const TopNavigation = () => {
    return (
        <Toolbar>
            <ToolbarItem>
                <Button>About Us</Button>
            </ToolbarItem>
            <ToolbarItem>
                <Button>Contact Us</Button>
            </ToolbarItem>
            <div style={{ flexGrow: 1 }}></div>
            <ToolbarItem>
                <Menu>
                    <MenuTrigger>
                        <Button>
                            <Avatar name="User Name" />
                        </Button>
                    </MenuTrigger>
                    <MenuPopover>
                        <MenuList>
                            <MenuItem>Profile</MenuItem>
                            <MenuItem>Settings</MenuItem>
                            <MenuItem>Logout</MenuItem>
                        </MenuList>
                    </MenuPopover>
                </Menu>
            </ToolbarItem>
        </Toolbar>
    );
};

export default TopNavigation;
