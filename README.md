# cyphal_tools

## Before
### git is needed to execute scripts, install it:
```sudo apt update && sudo apt install git```

## Deployment
### Clone this repository into $HOME/BRT/gitwork:
```mkdir -p $HOME/BRT/gitwork && cd $HOME/BRT/gitwork && git clone https://github.com/bakul14/cyphal_tools.git```

### To install docker and docker-compose, run the script install.sh:
```cd $HOME/BRT/gitwork/cyphal_tools && sudo chmod +x install.sh && sudo ./install.sh```

### To install BRTCyphal repository and dependencies for the virtual CAN bus, run the script deploy_infrastructure.sh:
```cd $HOME/BRT/gitwork/cyphal_tools && sudo chmod +x install.sh && sudo ./deploy_infrastructure.sh```

## After
### To enter environment:
```docker-compose run cyphal bash```