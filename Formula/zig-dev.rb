class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d803f194adde8bf0aa1eb0dddc600f457d6c67bfc1f6afc37e219d4bbb5c4c65" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "09b5700415df6300f3d39904e9655281d3d2812046a8ae383596154331051bc1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "aa6dbe94bd8b235695f8177bc414155c0a4ce62aa9b8067cbab7bd84fbf6ce73" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.263+62f727eed.tar.xz"
  version "0.12.0-dev.263+62f727eed"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
