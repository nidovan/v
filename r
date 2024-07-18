// TopNavigation.js
import React from 'react';
import { Menu, MenuItem, MenuList, MenuPopover, MenuTrigger, Button, Avatar, Toolbar, makeStyles } from '@fluentui/react-components';

const useStyles = makeStyles({
    toolbar: {
        display: 'flex',
        justifyContent: 'space-between',
        alignItems: 'center',
        padding: '0 20px',
        borderBottom: '1px solid #e1e1e1',
    },
    logoContainer: {
        display: 'flex',
        alignItems: 'center',
        gap: '10px',
    },
    logo: {
        height: '40px', // Adjust as needed
    },
    appName: {
        fontSize: '20px',
        fontWeight: 'bold',
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
            <div className={classes.logoContainer}>
                <img src="path-to-your-logo.png" alt="Logo" className={classes.logo} />
                <span className={classes.appName}>Your App Name</span>
            </div>
            <div className={classes.navItems}>
                <Menu>
                    <MenuTrigger>
                        <Button appearance="subtle">About Us</Button>
                    </MenuTrigger>
                    <MenuPopover>
                        <MenuList>
                            <MenuItem>Our Story</MenuItem>
                            <MenuItem>Team</MenuItem>
                            <MenuItem>Careers</MenuItem>
                        </MenuList>
                    </MenuPopover>
                </Menu>
                <Menu>
                    <MenuTrigger>
                        <Button appearance="subtle">Contact Us</Button>
                    </MenuTrigger>
                    <MenuPopover>
                        <MenuList>
                            <MenuItem>Email</MenuItem>
                            <MenuItem>Phone</MenuItem>
                            <MenuItem>Locations</MenuItem>
                        </MenuList>
                    </MenuPopover>
                </Menu>
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
