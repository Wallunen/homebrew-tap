class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "70ca27740bffbac79cb7243f4b881e7c85b34958139e5f112425bee1131ac2aa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3afc0f28065ba7505a59e6531a9b5a66fb7b257c0ae8c4f3fd4f4bd5fcf8db45" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c49ec0b80d85d876e28af4065a6f705b0d917542eecc7064bb7c2602cfaed750" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3329+1ab008d89.tar.xz"
  version "0.11.0-dev.3329+1ab008d89"
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
