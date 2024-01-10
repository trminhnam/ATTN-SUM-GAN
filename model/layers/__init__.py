import os
import sys

import sys
sys.path
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))

from layers.discriminator import Discriminator
from layers.summarizer import Summarizer
from layers.transformers import AttentiveDiscriminator, AttentiveSummarizer
