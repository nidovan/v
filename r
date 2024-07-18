// TopNavigation.js
import React from 'react';
import { Menu, MenuItem, MenuList, MenuPopover, MenuTrigger, Button, Avatar, Toolbar, ToolbarButton, makeStyles } from '@fluentui/react-components';

const useStyles = makeStyles({
    toolbar: {
        display: 'flex',
        justifyContent: 'space-between',
        padding: '0 20px',
        borderBottom: '1px solid #e1e1e1',
    },
    navItems: {
        display: 'flex',
        alignItems: 'center',
        gap: '15px',
    },
    rightItems: {
        display: 'flex',
        alignItems: 'center',
    },
});

const TopNavigation = () => {
    const classes = useStyles();

    return (
        <Toolbar className={classes.toolbar}>
            <div className={classes.navItems}>
                <ToolbarButton appearance="subtle">About Us</ToolbarButton>
                <ToolbarButton appearance="subtle">Contact Us</ToolbarButton>
            </div>
            <div className={classes.rightItems}>
                <Menu>
                    <MenuTrigger>
                        <Button appearance="subtle">
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
            </div>
        </Toolbar>
    );
};

export default TopNavigation;
