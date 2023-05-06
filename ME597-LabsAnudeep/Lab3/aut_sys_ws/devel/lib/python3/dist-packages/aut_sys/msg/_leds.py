# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from aut_sys/leds.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class leds(genpy.Message):
  _md5sum = "0922e2641925161f827e709fa80313c4"
  _type = "aut_sys/leds"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """uint8 r1
uint8 r2
uint8 r3
uint8 g1
uint8 g2
uint8 g3
uint8 b1
uint8 b2
uint8 b3
"""
  __slots__ = ['r1','r2','r3','g1','g2','g3','b1','b2','b3']
  _slot_types = ['uint8','uint8','uint8','uint8','uint8','uint8','uint8','uint8','uint8']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       r1,r2,r3,g1,g2,g3,b1,b2,b3

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(leds, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.r1 is None:
        self.r1 = 0
      if self.r2 is None:
        self.r2 = 0
      if self.r3 is None:
        self.r3 = 0
      if self.g1 is None:
        self.g1 = 0
      if self.g2 is None:
        self.g2 = 0
      if self.g3 is None:
        self.g3 = 0
      if self.b1 is None:
        self.b1 = 0
      if self.b2 is None:
        self.b2 = 0
      if self.b3 is None:
        self.b3 = 0
    else:
      self.r1 = 0
      self.r2 = 0
      self.r3 = 0
      self.g1 = 0
      self.g2 = 0
      self.g3 = 0
      self.b1 = 0
      self.b2 = 0
      self.b3 = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_9B().pack(_x.r1, _x.r2, _x.r3, _x.g1, _x.g2, _x.g3, _x.b1, _x.b2, _x.b3))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 9
      (_x.r1, _x.r2, _x.r3, _x.g1, _x.g2, _x.g3, _x.b1, _x.b2, _x.b3,) = _get_struct_9B().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_9B().pack(_x.r1, _x.r2, _x.r3, _x.g1, _x.g2, _x.g3, _x.b1, _x.b2, _x.b3))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 9
      (_x.r1, _x.r2, _x.r3, _x.g1, _x.g2, _x.g3, _x.b1, _x.b2, _x.b3,) = _get_struct_9B().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_9B = None
def _get_struct_9B():
    global _struct_9B
    if _struct_9B is None:
        _struct_9B = struct.Struct("<9B")
    return _struct_9B