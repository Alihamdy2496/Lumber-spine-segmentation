import json
from data_loader import get_loader

def main(config):
    # Create directories if not exist

    print(config)
        
    train_loader = get_loader(config["root_path"]+"training_data/", 1)



    

if __name__ == '__main__':
    with open('config.json') as json_data:
        config = json.loads(json_data.read())

    main(config)
