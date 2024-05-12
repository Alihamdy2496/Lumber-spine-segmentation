import torch
from torch.utils import data
import SimpleITK as sitk
import glob 

class ImageFolder(data.Dataset):
	def __init__(self, root, device='cuda'):
		"""Initializes image paths and preprocessing module."""
		self.root = root
		self.device = device
		# GT : Ground Truth
		self.masks_paths = glob.glob(root+'masks/'+'/*')
		self.image_paths = glob.glob(root+'images/'+'/*')
		self.image_size = (620, 480)
  
	def __getitem__(self, index):
		"""Reads an image from a file and pre processes it and returns."""
		image_path = self.image_paths[index]
		mask_path = self.image_paths[index]
		mask = torch.tensor(sitk.GetArrayFromImage(sitk.ReadImage(mask_path)), device=self.device)
		image = torch.tensor(sitk.GetArrayFromImage(sitk.ReadImage(image_path)), device=self.device)
		# ToDo: pad all images to have a fixed size

		return image, mask

	def __len__(self):
		"""Returns the total number of font files."""
		return len(self.image_paths)

def get_loader(image_path, batch_size, num_workers=2):
	"""Builds and returns Dataloader."""
	
	dataset = ImageFolder(root = image_path)
	data_loader = data.DataLoader(dataset=dataset,
								  batch_size=batch_size,
								  shuffle=True,
								  num_workers=num_workers)
	return data_loader

if __name__ == "__main__":
	data_loader = get_loader("training_data/", 1)
	for i, (images, GT) in enumerate(data_loader):
		pass
