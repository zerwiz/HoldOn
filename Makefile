# Hold On - Makefile
# Quick commands for building and deploying

.PHONY: help install start android ios build clean

help:
	@echo "Hold On - Available Commands"
	@echo "=============================="
	@echo "make install    - Install dependencies"
	@echo "make start      - Start Expo development server"
	@echo "make android    - Run on Android"
	@echo "make ios        - Run on iOS"
	@echo "make build      - Build for production"
	@echo "make clean      - Clean build artifacts"

install:
	@echo "Installing dependencies..."
	npm install

start:
	@echo "Starting Expo development server..."
	npm start

android:
	@echo "Starting Android..."
	npm run android

ios:
	@echo "Starting iOS..."
	npm run ios

build:
	@echo "Building for production..."
	npm run build:android

clean:
	@echo "Cleaning build artifacts..."
	rm -rf node_modules
	rm -rf .expo
	rm -rf dist
	rm -rf web-build
