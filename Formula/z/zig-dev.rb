class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "53fc1f87696d149d2cc38076fbd8fbd9b3f29927ce6c5c4b6f872322f82b18b4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6efe2aeb66258d37889a7b0970df4d2fc365e232547f591f7d129a4ed4ff7c5e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a83a4bcc91c8a962554d9f7f6ffb9fbf762018005d38cafba15ef5bdddba466f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2465+70de2f3a7.tar.xz"
  version "0.14.0-dev.2465+70de2f3a7"
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
