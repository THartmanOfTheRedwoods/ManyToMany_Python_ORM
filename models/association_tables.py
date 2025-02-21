from sqlalchemy import Table, Column, Integer, ForeignKey, DateTime
from datetime import datetime
# Import the shared Base object. It must be a single object to ensure
# relationships can be found
from .base import Base

user_group_membership = Table(
    'USER_GROUP_MEMBERSHIP', Base.metadata,
    Column('userId', Integer, ForeignKey('USER.userId'), primary_key=True),
    Column('groupId', Integer, ForeignKey('USER_GROUP.groupId'), primary_key=True),
    Column('joinedAt', DateTime, default=datetime.utcnow)
)