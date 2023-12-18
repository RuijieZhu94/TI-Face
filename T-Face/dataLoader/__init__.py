from .llff import LLFFDataset
from .blender import BlenderDataset
from .nsvf import NSVF
from .tankstemple import TanksTempleDataset
from .your_own_data import YourOwnDataset
from .ILSH import ILSHDataset
from .ILSH_rgba import ILSH2Dataset


dataset_dict = {'blender': BlenderDataset,
               'llff':LLFFDataset,
               'tankstemple':TanksTempleDataset,
               'nsvf':NSVF,
               'ILSH':ILSHDataset,
               'ILSH_RGBA': ILSH2Dataset,
                'own_data':YourOwnDataset}