from pydantic import BaseModel, Field, ConfigDict
from typing import List, Optional

class Restaurant(BaseModel):
    id: Optional[int] = None
    name: str = Field(max_length=100)
    address: str = Field(max_length=255)
    model_config = ConfigDict(from_attributes=True)

class Chef(BaseModel):
    id: Optional[int] = None
    name: str = Field(max_length=100)
    restaurant_id: int
    model_config = ConfigDict(from_attributes=True)

class Pizza(BaseModel):
    id: Optional[int] = None
    name: str = Field(max_length=100)
    cheese: str = Field(max_length=50)
    dough: str = Field(max_length=50)
    secret_ingredient: Optional[str] = Field(None, max_length=100)
    ingredients: List[str] = Field(default_factory=list)
    restaurant_id: int
    model_config = ConfigDict(from_attributes=True)

class Ingredient(BaseModel):
    id: Optional[int] = None
    name: str = Field(max_length=50)
    model_config = ConfigDict(from_attributes=True)

class Review(BaseModel):
    id: Optional[int] = None
    restaurant_id: int
    rating: int = Field(..., ge=1, le=5)
    text: Optional[str] = Field(None, max_length=500)
    model_config = ConfigDict(from_attributes=True)

class ReviewOut(BaseModel):
    id: int
    restaurant_name: str
    rating: int
    text: Optional[str]
    model_config = ConfigDict(from_attributes=True)