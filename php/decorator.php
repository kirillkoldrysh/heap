<?php

interface IComponent
{
	public function operation(): string;
}

class Component
{
	public function operation(): string
	{
		return 'Component';
	}
}

class BaseDecorator extends Component
{
	public function __construct(protected Component $component) { }

	public function operation(): string
	{
		return $this->component->operation();
	}
}

class DecoratorA extends BaseDecorator
{
	public function operation(): string
	{
		return 'DecoratorA(' . parent::operation() . ')';
	}
}

class DecoratorB extends BaseDecorator
{
	public function operation(): string
	{
		return 'DecoratorB(' . parent::operation() . ')';
	}
}

class DecoratorC extends BaseDecorator
{
	public function operation(): string
	{
		return 'DecoratorC(' . parent::operation() . ')';
	}
}

$component = new Component();
$decoratorA = new DecoratorA($component);
$decoratorB = new DecoratorB($decoratorA);
$decoratorC = new DecoratorC($decoratorB);

echo $component->operation() . PHP_EOL;
echo $decoratorA->operation() . PHP_EOL;
echo $decoratorB->operation() . PHP_EOL;
echo $decoratorC->operation() . PHP_EOL;

