defmodule OpTest.ParamsGenerator.FloatTest do
  use ExUnit.Case, async: false
  use ExUnitProperties

  import ExopProps.ParamsGenerator.Float, only: [generate: 1]

  property "generates float generator" do
    check all value <- generate([]) do
      assert is_float(value)
    end
  end

  describe "with :numericality option" do
    property "equal_to" do
      generator = generate(numericality: %{equal_to: 12.3})

      check all value <- generator do
        assert value == 12.3
      end
    end

    property "greater_than" do
      generator = generate(numericality: %{greater_than: 1.0})

      check all value <- generator do
        assert value > 1.0
      end
    end

    property "greater_than_or_equal_to" do
      generator = generate(numericality: %{greater_than_or_equal_to: 1.0})

      check all value <- generator do
        assert value >= 1.0
      end
    end

    property "less_than" do
      generator = generate(numericality: %{less_than: 1.0})

      check all value <- generator do
        assert value < 1.0
      end
    end

    property "less_than_or_equal_to" do
      generator = generate(numericality: %{less_than_or_equal_to: 1.0})

      check all value <- generator do
        assert value <= 1.0
      end
    end

    property "equal_to & greater_than" do
      generator = generate(numericality: %{equal_to: 12.3, greater_than: 1.0})

      check all value <- generator do
        assert value == 12.3
      end
    end

    property "greater_than & less_than" do
      generator = generate(numericality: %{greater_than: 1.0, less_than: 3.0})

      check all value <- generator do
        assert value > 1.0
        assert value < 3.0
      end
    end

    property "greater_than_or_equal_to & less_than" do
      generator = generate(numericality: %{greater_than_or_equal_to: 1.0, less_than: 3.0})

      check all value <- generator do
        assert value >= 1.0
        assert value < 3.0
      end
    end

    property "greater_than_or_equal_to & less_than_or_equal_to" do
      generator =
        generate(numericality: %{greater_than_or_equal_to: 1.0, less_than_or_equal_to: 3.0})

      check all value <- generator do
        assert value >= 1.0
        assert value <= 3.0
      end
    end

    property "greater_than & less_than_or_equal_to" do
      generator = generate(numericality: %{greater_than: 1.0, less_than_or_equal_to: 3.0})

      check all value <- generator do
        assert value > 1.0
        assert value <= 3.0
      end
    end
  end
end
