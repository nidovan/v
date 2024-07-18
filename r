import { Menu, MenuItem, MenuList, MenuPopover, MenuTrigger, Button, Toolbar, ToolbarButton } from '@fluentui/react-components';

const TopNavigation = () => {
    return (
        <Toolbar>
            <ToolbarButton>
                <Menu>
                    <MenuTrigger>
                        <Button>Menu</Button>
                    </MenuTrigger>
                    <MenuPopover>
                        <MenuList>
                            <MenuItem>Home</MenuItem>
                            <MenuItem>About</MenuItem>
                            <MenuItem>Services</MenuItem>
                            <MenuItem>Contact</MenuItem>
                        </MenuList>
                    </MenuPopover>
                </Menu>
            </ToolbarButton>
            {/* Add more buttons or elements as needed */}
        </Toolbar>
    );
};

export default TopNavigation;
