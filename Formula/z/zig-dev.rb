class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261009-145321"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a7e8ce39a6a608c3e297e74dc75fb61921a36881c533a7f384e75e96021d8d48"
    sha256 cellar: :any_skip_relocation, sequoia:      "555c7fa546cd3bd2fd46da60812260a650bc6c115e1074f4a5c88b5c9e9bbbe9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bcb47f9612541b4340355a21e95de1de77cc8e445c61529d81c3d8bbe682d9fe"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "792bae330fa10186f7950e82af75bb9be4940fb85997c0be221737eeb085aa2b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "48935a7ae2519a553b4f9eb15400d9bb561010ebe8dc56bdc1d852de3306f2c6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cdecd965d8b8795afbb9f1a780904cba190d257ee7cd1d33347c4026dab5f64c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.18.0-dev.131+41f885830.tar.xz"
  version "0.18.0-dev.131+41f885830"
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
