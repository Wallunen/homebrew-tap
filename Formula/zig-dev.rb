class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b52fedac39fd347cee8a1fcac9d2d7ff92f67123f8121a0390f3317efbe10470" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "90da68f9fd805ce70d8f42e9b66c7bbb315f975da91d20cfa2a4febf1b2a306c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fb79e842a8edf4cb41001d6a4297b6cbf43ec90a21e46a20a8b45cab90d6f8e0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2571+31738de28.tar.xz"
  version "0.11.0-dev.2571+31738de28"
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
