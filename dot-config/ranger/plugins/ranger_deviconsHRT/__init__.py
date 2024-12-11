import os
import ranger.api
from ranger.core.linemode import LinemodeBase
from .devicons import *
from ranger.ext.human_readable import human_readable, human_readable_time

SEPARATOR = os.getenv('RANGER_DEVICONS_SEPARATOR', ' ')

@ranger.api.register_linemode
class DevIconsLinemode(LinemodeBase):
  name = "deviconsHRT"

  uses_metadata = False

  def filetitle(self, file, metadata):
    return devicon(file) + SEPARATOR + file.relative_path

  def infostring(self, fobj, metadata):
    if fobj.is_directory:
      raise NotImplementedError
    if fobj.stat is None:
      return '?'
    return human_readable_time(fobj.stat.st_mtime)
